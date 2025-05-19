import "@typespec/http";
import "@typespec/openapi3";
import "@typespec/versioning";
import "./models/index.tsp";
import "./models/response.tsp";

using TypeSpec.Http;

@service(#{ title: "Maahita Backend API Services" })
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

  @route("/api/v1/classes")
  @tag("Classes")
  interface Classes {
    /** List classes */
    @get
    @useAuth(BearerAuth)
    list(
    ): ListResponse<Class> | UnauthorizedErrorResponse | RateLimitErrorResponse;

    /** Read class */
    @get
    @useAuth(BearerAuth)
    read(@path classId: int32):
      | SuccessResponse<Class>
      | NotFoundErrorResponse<Class>
      | UnauthorizedErrorResponse
      | RateLimitErrorResponse;

    /** Create a class */
    @post
    @useAuth(BearerAuth)
    create(@body body: Class):
      | AcceptResponse<Class>
      | ValidationErrorResponse<Class>
      | ConflictErrorResponse<Class>
      | UnauthorizedErrorResponse
      | InternalServerErrorResponse;

    /** Update a class */
    @patch
    @useAuth(BearerAuth)
    update(@path classId: int32, @body body: Class):
      | UpdateResponse<Class>
      | ValidationErrorResponse<Class>
      | NotFoundErrorResponse<Class>
      | UnauthorizedErrorResponse
      | InternalServerErrorResponse;

    /** Delete a class */
    @delete
    @useAuth(BearerAuth)
    delete(@path classId: int32):
      | SuccessResponse<Class>
      | NotFoundErrorResponse<Class>
      | UnauthorizedErrorResponse
      | InternalServerErrorResponse;
  }
}
