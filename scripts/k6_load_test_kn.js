import { sleep } from 'k6';
import http from 'k6/http';

const url = 'http://demo-native.default.127.0.0.1.sslip.io';

export default function () {
    let data = "payload";
    http.post(url, data, {
        headers: { 'Content-Type': 'plain/text' },
    });
    sleep(1);
}
