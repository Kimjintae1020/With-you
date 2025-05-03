package With.you.example.With.you.Exception;

public enum ErrorCode
{
    ACCOUNT_NOT_FOUND("계정을 찾을 수 없습니다."),
    BOARD_NOT_FOUND("게시글을 찾을 수 없습니다."),
    NO_EDIT_PERMISSION("작성자가 아닙니다."),
    COMMENT_NOT_FOUND("댓글을 찾을 수 없습니다."),
    UNATHORIZED("삭제할 권한이 없습니다.")

    ;

    private final String message;

    ErrorCode(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
