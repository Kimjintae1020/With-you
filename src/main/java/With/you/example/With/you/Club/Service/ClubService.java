package With.you.example.With.you.Club.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Club.Dto.ClubPageResponse;
import With.you.example.With.you.Club.Dto.DtoClubPage;
import With.you.example.With.you.Club.Enum.Category;
import With.you.example.With.you.Club.Repository.ClubMemberRepository;
import With.you.example.With.you.Club.Repository.ClubRepository;
import With.you.example.With.you.Club.Dto.DtoCreateClub;
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
                .status("ACTIVE")
                .build();

        clubRepository.save(club);


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

}
