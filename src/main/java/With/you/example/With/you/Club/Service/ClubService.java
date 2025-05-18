package With.you.example.With.you.Club.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Service.AccountService;
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

}
