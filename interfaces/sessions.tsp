import "../models/index.tsp";
import "../models/response.tsp";

using TypeSpec.Http;

namespace MaahitaAPIServices {
    @route("/api/v1/sessions")
    @tag("Sessions")
    interface Sessions {
        /** List sessions */
        @get
        @useAuth(BearerAuth)
        list(
        ): ListResponse<Session> | UnauthorizedErrorResponse | RateLimitErrorResponse;

        /** Read session */
        @get
        @useAuth(BearerAuth)
        read(@path classId: int32):
            | SuccessResponse<Session>
            | NotFoundErrorResponse<Session>
            | UnauthorizedErrorResponse
            | RateLimitErrorResponse;

        /** Create a session */
        @post
        @useAuth(BearerAuth)
        create(@body body: Session):
            | AcceptResponse<Session>
            | ValidationErrorResponse<Session>
            | ConflictErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** Update a session */
        @patch
        @useAuth(BearerAuth)
        update(@path classId: int32, @body body: Session):
            | SuccessResponse<Session>
            | ValidationErrorResponse<Session>
            | NotFoundErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** Delete a session */
        @delete
        @useAuth(BearerAuth)
        delete(@path classId: int32):
            | SuccessResponse<Session>
            | NotFoundErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;
    }
}
