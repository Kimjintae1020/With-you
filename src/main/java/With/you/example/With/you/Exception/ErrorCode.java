package With.you.example.With.you.Exception;

public enum ErrorCode
{
    ACCOUNT_NOT_FOUND("계정을 찾을 수 없습니다."),
    BOARD_NOT_FOUND("게시글을 찾을 수 없습니다.")

    ;

    private final String message;

    ErrorCode(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
