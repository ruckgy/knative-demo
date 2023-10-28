import http from 'k6/http';

const url = 'http://localhost:8080';

export default function () {
    let data = "payload";
    http.post(url, data, {
        headers: { 'Content-Type': 'plain/text' },
    });
}
