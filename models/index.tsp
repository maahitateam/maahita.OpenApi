import "@typespec/http";

@example(#{ classId: 123456, deliveryMode: DeliveryMode.inPerson })
model Session {
    classId: int32;
    deliveryMode: DeliveryMode;
}

enum DeliveryMode {
    inPerson: "in-person",
    online: "online",
    hybrid: "hybrid",
}
