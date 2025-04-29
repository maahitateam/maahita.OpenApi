import "@typespec/http";
@error
model Error {
    code: int32;
    message: string;
}

model Session {
    classId: int32;
    deliveryMode: "in-person" | "online";
}
