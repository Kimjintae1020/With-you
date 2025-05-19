package With.you.example.With.you.Club.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Club.Dto.ClubListResponse;
import With.you.example.With.you.Club.Repository.ClubMemberRepository;
import With.you.example.With.you.Club.Repository.ClubRepository;
import With.you.example.With.you.Club.Dto.DtoCreateClub;
import With.you.example.With.you.Club.Entity.Club;
import With.you.example.With.you.Club.Entity.ClubMember;
import With.you.example.With.you.Club.Enum.ClubMemberRole;
import With.you.example.With.you.Club.Enum.ClubMemberStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubService {

    private final ClubRepository clubRepository;
    private final AccountService accountService;
    private final ClubMemberRepository clubMemberRepository;

    // 동호회 생성 기능
    @Transactional
    public void createClub(String accountName, DtoCreateClub dtoCreateClub) {

        Account account = accountService.getAccountByName(accountName);
        if (account == null) {
            throw new IllegalArgumentException("회원 정보를 찾을 수 없습니다.");
        }

        if (clubRepository.existsByClubName(dtoCreateClub.getClubName())) {
            throw new IllegalArgumentException("이미 존재하는 동호회 이름입니다.");
        }

        Club club = Club.builder()
                .clubName(dtoCreateClub.getClubName())
                .description(dtoCreateClub.getDescription())
                .category(dtoCreateClub.getCategory())
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
    public List<ClubListResponse> getClubList(String accountName) {

        Account account = accountService.getAccountByName(accountName);
        if (account == null) {
            throw new IllegalArgumentException("사용자 정보를 찾을 수 없습니다.");
        }

        List<Club> clubs = clubRepository.findByStatusAndIsPublicOrderByCreatedAtDesc("ACTIVE", true);

        return clubs.stream()
                .map(club -> {
                    boolean isMember = clubMemberRepository.existsByClubAndAccount(club, account);
                    boolean isLeader = club.getLeader().getAccountid().equals(account.getAccountid());

                    return ClubListResponse.builder()
                            .clubId(club.getClubId())
                            .clubName(club.getClubName())
                            .category(club.getCategory())
                            .region(club.getRegion())
                            .currentMembers(club.getCurrentMembers())
                            .maxMembers(club.getMaxMembers())
                            .leaderNickname(club.getLeader().getNickname())
                            .meetingFrequency(club.getMeetingFrequency())
                            .meetingLocation(club.getMeetingLocation())
                            .isMember(isMember)
                            .isLeader(isLeader)
                            .createdAt(club.getCreatedAt())
                            .build();
                })
                .collect(Collectors.toList());
    }
}
