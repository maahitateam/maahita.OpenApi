import "../models/index.tsp";
import "../models/response.tsp";

using TypeSpec.Http;

namespace MaahitaAPIServices {
    @route("/api/v1/schools")
    @tag("Schools")
    interface Schools {
        /** List schools */
        @get
        @useAuth(BearerAuth)
        list(
        ): ListResponse<School> | UnauthorizedErrorResponse | RateLimitErrorResponse;

        /** Read school */
        @get
        @useAuth(BearerAuth)
        read(@path schoolId: string):
            | SuccessResponse<School>
            | NotFoundErrorResponse<School>
            | UnauthorizedErrorResponse
            | RateLimitErrorResponse;

        /** Create a class */
        @post
        @useAuth(BearerAuth)
        create(@body body: School):
            | AcceptResponse<School>
            | ValidationErrorResponse<School>
            | ConflictErrorResponse<School>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** Update a class */
        @put
        @useAuth(BearerAuth)
        update(@path schoolId: string, @body body: School):
            | UpdateResponse<School>
            | ValidationErrorResponse<School>
            | NotFoundErrorResponse<School>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** Delete a class */
        @delete
        @useAuth(BearerAuth)
        delete(@path schoolId: string):
            | SuccessResponse<School>
            | NotFoundErrorResponse<School>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;
    }
}
