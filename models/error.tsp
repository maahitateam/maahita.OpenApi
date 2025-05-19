@error
model NotFoundError {
    code: "NOT_FOUND";
    message: string;
}

@error
model ValidationError {
    code: "VALIDATION_ERROR";
    message: string;
    details: string[];
}

@error
model InternalServerError {
    code: "INTERNAL_SERVER_ERROR";
    message: string;
}

@error
model UnauthorizedError {
    code: "UN_AUTHORIZED_ERROR";
    message: string;
}

@error
model RateLimitError {
    code: "RATE_LIMIT_ERROR";
    message: string;
    retryAfter: int16;
}

@error
model ForbiddenError {
    code: "FORBIDDEN_ERROR";
    message: string;
}
