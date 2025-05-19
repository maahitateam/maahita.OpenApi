import "@typespec/http";
import "./index.tsp";
import "./error.tsp";

using TypeSpec.Http;

@doc("Response for a successful list of sessions.")
model ListResponse<T> {
    @statusCode statusCode: 200;
    @body list: T[];
}

@doc("Response for a successful session fetch.")
model SuccessResponse<T> {
    @statusCode statusCode: 200;
    @body body: T;
}

@doc("Response for a successful session creation.")
model CreateResponse<T> {
    @statusCode statusCode: 201;
    @body body: T;
}

@doc("Response for a successful session acceptance.")
model AcceptResponse<T> {
    @statusCode statusCode: 202;
    @body body: T;
}

@doc("Response for a successful session update.")
model UpdateResponse<T> {
    @statusCode statusCode: 200;
    @body body: T;
}

@doc("Response for internal server errors.")
model InternalServerErrorResponse {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
}

@doc("Response for session validation errors.")
model ValidationErrorResponse<T> {
    @statusCode statusCode: 400;
    @body error: ValidationError;
}

@doc("Response when a session is not found.")
model NotFoundErrorResponse<T> {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
}

@doc("Response for unauthorized session access.")
model UnauthorizedErrorResponse {
    @statusCode statusCode: 401;
    @body error: UnauthorizedError;
}

@doc("Response for forbidden session access.")
model ForbiddenErrorResponse {
    @statusCode statusCode: 403;
    @body error: ForbiddenError;
}

@doc("Response for session conflict errors.")
model ConflictErrorResponse<T> {
    @statusCode statusCode: 409;
    @body error: ValidationError;
}

@doc("Response for rate limiting errors.")
model RateLimitErrorResponse {
    @statusCode statusCode: 429;
    @body error: RateLimitError;
}
