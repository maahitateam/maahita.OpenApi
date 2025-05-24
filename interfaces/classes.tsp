import "../models/index.tsp";
import "../models/response.tsp";

using TypeSpec.Http;

namespace MaahitaAPIServices {
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
        @put
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
