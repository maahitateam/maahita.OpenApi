import "@typespec/http";
import "@typespec/openapi3";
import "@typespec/versioning";
import "./models/index.tsp";
import "./models/response.tsp";

using TypeSpec.Http;

@service(#{ title: "Session Service" })
namespace SessionService {
  @route("/api/v1/sessions")
  @tag("Sessions")
  interface Sessions {
    /** List sessions */
    @get
    @useAuth(BearerAuth)
    list(
    ): SessionListResponse | SessionUnauthorizedErrorResponse | RateLimitErrorResponse;

    /** Read session */
    @get
    @useAuth(BearerAuth)
    read(@path classId: int32):
      | SessionResponse
      | SessionNotFoundErrorResponse
      | SessionUnauthorizedErrorResponse
      | RateLimitErrorResponse;

    /** Create a session */
    @post
    @useAuth(BearerAuth)
    create(@body body: Session):
      | SessionAcceptResponse
      | SessionValidationErrorResponse
      | SessionConflictErrorResponse
      | SessionUnauthorizedErrorResponse
      | InternalServerErrorResponse;

    /** Update a session */
    @patch
    @useAuth(BearerAuth)
    update(@path classId: int32, @body body: Session):
      | SessionResponse
      | SessionValidationErrorResponse
      | SessionNotFoundErrorResponse
      | SessionUnauthorizedErrorResponse
      | InternalServerErrorResponse;

    /** Delete a session */
    @delete
    @useAuth(BearerAuth)
    delete(@path classId: int32):
      | SessionResponse
      | SessionNotFoundErrorResponse
      | SessionUnauthorizedErrorResponse
      | InternalServerErrorResponse;
  }
}
