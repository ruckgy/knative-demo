import { sleep } from 'k6';
// import * as kafka from "k6/x/kafka";
import {
    Writer,
    Reader,
    Connection,
    SchemaRegistry,
    SCHEMA_TYPE_STRING,
} from "k6/x/kafka"; // import kafka extension

// Prints module-level constants
// console.log(kafka);

const brokers = ["my-cluster-kafka-bootstrap.kafka:9092"];
const topic = "my-topic";

const writer = new Writer({
    brokers: brokers,
    topic: topic,
    autoCreateTopic: false,
});
const connection = new Connection({
    address: brokers[0],
});
const schemaRegistry = new SchemaRegistry();

export const options = {
    vus: 0,
    thresholds: {
        // Base thresholds to see if the writer or reader is working
        kafka_writer_error_count: ["count == 0"],
        kafka_reader_error_count: ["count == 0"],
    },
    stages: [
        { target: 1, duration: '10s' },
        { target: 100, duration: '30s' },
        { target: 0, duration: '30s' },
    ],
};

export default function () {
    let text = (Math.random() + 1).toString(36).substring(7);
    let now = new Date();

    let messages = [
        {
            key: schemaRegistry.serialize({
                data: now,
                schemaType: SCHEMA_TYPE_STRING,
            }),
            value: schemaRegistry.serialize({
                data: text,
                schemaType: SCHEMA_TYPE_STRING,
            }),
            headers: {
                'ce-type': "start",
            },
            time: now, // Will be converted to timestamp automatically
        }
    ];

    writer.produce({ messages: messages });
    sleep(1);
}

export function teardown(data) {
    writer.close();
    connection.close();
}
