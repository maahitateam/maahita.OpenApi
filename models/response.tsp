import "@typespec/http";
import "./index.tsp";
import "./error.tsp";

using TypeSpec.Http;

model SessionListResponse {
    ...OkResponse;
    ...Body<Session[]>;
}

model SessionResponse {
    ...OkResponse;
    ...Body<Session>;
}

model SessionCreateResponse {
    ...CreatedResponse;
    ...Body<Session>;
}

model SessionAcceptResponse {
    ...AcceptedResponse;
    ...Body<Session>;
}

model SessionUpdateResponse {
    ...OkResponse;
    ...Body<Session>;
}

model InternalServerErrorResponse {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
}

model SessionValidationErrorResponse {
    ...BadRequestResponse;
    ...Body<ValidationError>;
}

model SessionNotFoundErrorResponse {
    ...NotFoundResponse;
    ...Body<NotFoundError>;
}

model SessionUnauthorizedErrorResponse {
    ...UnauthorizedResponse;
    ...Body<UnauthorizedError>;
}
model SessionForbiddenErrorResponse {
    ...ForbiddenResponse;
    ...Body<UnauthorizedError>;
}
model SessionConflictErrorResponse {
    ...ConflictResponse;
    ...Body<ValidationError>;
}
