package With.you.example.With.you.Club.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Club.Dto.*;
import With.you.example.With.you.Club.Enum.Category;
import With.you.example.With.you.Club.Repository.ClubMemberRepository;
import With.you.example.With.you.Club.Repository.ClubRepository;
import With.you.example.With.you.Club.Entity.Club;
import With.you.example.With.you.Club.Entity.ClubMember;
import With.you.example.With.you.Club.Enum.ClubMemberRole;
import With.you.example.With.you.Club.Enum.ClubMemberStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubService {

    private final ClubRepository clubRepository;
    private final AccountRepository accountRepository;
    private final ClubMemberRepository clubMemberRepository;

    // 동호회 생성 기능
    @Transactional
    public void createClub(String accountName, DtoCreateClub dtoCreateClub) {
        Optional<Account> optionalAccount = accountRepository.findByAccountnameIgnoreCase(accountName);

        if (optionalAccount.isEmpty()) {
            throw new IllegalArgumentException("회원 정보를 찾을 수 없습니다.");
        }

        if (clubRepository.existsByClubName(dtoCreateClub.getClubName())) {
            throw new IllegalArgumentException("이미 존재하는 동호회 이름입니다.");
        }

        Account account = optionalAccount.get();

        String categoryValue = dtoCreateClub.getCategory();
        if (categoryValue == null || categoryValue.trim().isEmpty()) {
            throw new IllegalArgumentException("카테고리를 선택해주세요.");
        }

        // 🌱 등급 여부 확인
        String status = account.getGrade() == Grade.SEED ? "INACTIVE" : "ACTIVE";

        Club club = Club.builder()
                .clubName(dtoCreateClub.getClubName())
                .description(dtoCreateClub.getDescription())
                .category(Category.valueOf(dtoCreateClub.getCategory().toUpperCase()))
                .region(dtoCreateClub.getRegion())
                .maxMembers(dtoCreateClub.getMaxMembers())
                .currentMembers(1) // 생성자가 첫 번째 멤버
                .isPublic(dtoCreateClub.isPublic())
                .meetingFrequency(dtoCreateClub.getMeetingFrequency())
                .meetingTime(dtoCreateClub.getMeetingTime())
                .meetingLocation(dtoCreateClub.getMeetingLocation())
                .dues(dtoCreateClub.getDues())
                .leader(account)
                .status(status)
                .build();

        clubRepository.save(club);

        // 동호회 멤버 추가 (리더)
        ClubMember clubMember = ClubMember.builder()
                .club(club)
                .account(account)
                .role(ClubMemberRole.LEADER)
                .joinedAt(LocalDateTime.now())
                .status(ClubMemberStatus.ACTIVE)
                .build();

        clubMemberRepository.save(clubMember);
    }


    // 동호회 목록 조회
    public ClubPageResponse getClubList(Pageable pageable) {
        Page<Club> clubsPage = clubRepository.findAll(pageable);

        List<DtoClubPage> clubs = clubsPage.stream()
                .map(club -> new DtoClubPage(club))
                .collect(Collectors.toList());

        return new ClubPageResponse(
                clubsPage.getNumber() + 1,
                clubsPage.getTotalPages(),
                (int) clubsPage.getTotalElements(),
                clubs
        );
    }

    // ClubService.java

    @Transactional(readOnly = true)
    public DtoClubDetail getClubDetail(String accountName, Long clubId) {
        // 1. 동호회 조회
        Club club = clubRepository.findById(clubId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 동호회입니다."));

        // 2. 로그인한 유저 정보 조회
        Account account = accountRepository.findByAccountnameIgnoreCase(accountName)
                .orElseThrow(() -> new IllegalArgumentException("회원 정보를 찾을 수 없습니다."));

        return new DtoClubDetail(
                club.getClubId(),
                club.getClubName(),
                club.getDescription(),
                club.getCategory(),
                club.getRegion(),
                club.getMaxMembers(),
                club.getCurrentMembers(),
                club.isPublic(),
                club.getMeetingFrequency(),
                club.getMeetingTime(),
                club.getMeetingLocation(),
                club.getDues(),
                club.getLeader(),
                club.getStatus(),
                club.getCreatedAt(),
                club.getUpdatedAt()
        );
    }

    // 동호회 맴버 조회
    // 동호회 멤버 조회
    public List<DtoClubMember> getClubMembers(Long clubId) {
        Club club = clubRepository.findById(clubId)
                .orElseThrow(() -> new IllegalArgumentException("해당 동호회를 찾을 수 없습니다."));

        // 전체 멤버 조회 (상태 무관)
        List<ClubMember> clubMembers = clubMemberRepository.findByClub(club);

        return clubMembers.stream()
                .map(cm -> new DtoClubMember(
                        cm.getAccount().getNickname(),
                        cm.getRole().name(),                           // 역할 (LEADER, MEMBER)
                        cm.getJoinedAt().toLocalDate().toString(),      // 가입일 (yyyy-MM-dd)
                        cm.getStatus().name()              // 상태 (활성, 비활성, 차단됨)
                ))
                .collect(Collectors.toList());
    }


    // 동호회 가입신청
    @Transactional
    public void joinClub(String accountName, Long clubId) {
        Account account = accountRepository.findByAccountname(accountName)
                .orElseThrow(() -> new IllegalArgumentException("계정을 찾을 수 없습니다."));

        Club club = clubRepository.findById(clubId)
                .orElseThrow(() -> new IllegalArgumentException("동호회를 찾을 수 없습니다."));

        // 중복 가입 여부 확인
        boolean alreadyJoined = clubMemberRepository.existsByClubAndAccount(club, account);
        if (alreadyJoined) {
            throw new IllegalStateException("이미 가입한 동호회입니다.");
        }

        // 가입
        ClubMember clubMember = ClubMember.builder()
                .club(club)
                .account(account)
                .role(ClubMemberRole.MEMBER)
                .status(ClubMemberStatus.INACTIVE)
                .joinedAt(LocalDateTime.now())
                .build();

        clubMemberRepository.save(clubMember);
    }


    // 관리자용 전체 동호회 목록 조회
    public List<DtoClubDetail> getAllClubsForAdmin() {
        List<Club> clubs = clubRepository.findAll();

        return clubs.stream()
                .map(club -> new DtoClubDetail(
                        club.getClubId(),
                        club.getClubName(),
                        club.getDescription(),
                        club.getCategory(),
                        club.getRegion(),
                        club.getMaxMembers(),
                        club.getCurrentMembers(),
                        club.isPublic(),
                        club.getMeetingFrequency(),
                        club.getMeetingTime(),
                        club.getMeetingLocation(),
                        club.getDues(),
                        club.getLeader(),
                        club.getStatus(),
                        club.getCreatedAt(),
                        club.getUpdatedAt()
                ))
                .collect(Collectors.toList());
    }

    @Transactional
    public void updateClubStatus(Long clubId, String newStatus) {
        Club club = clubRepository.findById(clubId)
                .orElseThrow(() -> new IllegalArgumentException("동호회를 찾을 수 없습니다."));

        // 상태 값 유효성 검사 (필요 시)
        if (!newStatus.equals("ACTIVE") && !newStatus.equals("INACTIVE")) {
            throw new IllegalArgumentException("잘못된 상태 값입니다.");
        }

        club.updateStatus(newStatus); // Club 엔티티에 메서드 추가

        clubRepository.save(club);
    }

}
