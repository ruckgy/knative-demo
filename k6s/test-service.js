import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
    scenarios: {
        test_reverse: {
            executor: 'ramping-arrival-rate',
            startTime: '5s',
            startRate: 5,
            timeUnit: '1s',
            stages: [
                { target: 20, duration: '15s' },
                { target: 300, duration: '15s' },
                { target: 0, duration: '30s' },
            ],
            preAllocatedVUs: 10,
            maxVUs: 100,
            tags: { test_type: 'api' },
            exec: 'test',
        },
    }
};

export function test() {
    const url = 'http://func-reverse.demo.127.0.0.1.sslip.io';
    const payload = JSON.stringify({
        "data": "Foo",
        "id": "1",
        "source": "my-source",
        "type": "my-type",
        "specversion": "1.0"
    });

    const params = {
        headers: {
            'Content-Type': 'application/cloudevents+json',
        },
    };

    http.post(url, payload, params);
}
