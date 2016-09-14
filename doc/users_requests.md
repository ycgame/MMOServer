## POST #create
ユーザーを作成.

### Example

#### Request
```
POST /users HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 14
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

name=testuser2
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 155
Content-Type: application/json; charset=utf-8
ETag: W/"4d661bc190cead29fee84e89354f186f"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 53688576-70aa-47cf-a909-7996b984db24
X-Runtime: 0.024201
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 2,
    "name": "testuser2",
    "token": null,
    "created_at": "2016-09-14T13:35:17.088Z",
    "updated_at": "2016-09-14T13:35:17.088Z"
  }
}
```

## POST #login
ログインしてTokenを取得.

### Example

#### Request
```
POST /users/1/login HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 174
Content-Type: application/json; charset=utf-8
ETag: W/"1befeb2178ca5adb7567dc1c671aaa4f"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: c371fe0f-80e9-4c4f-bfee-5a512c482e37
X-Runtime: 0.008970
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 1,
    "token": "7FdA9K3-lJt24Ubv-oAZ2w",
    "name": "testuser",
    "created_at": "2016-09-14T13:35:17.125Z",
    "updated_at": "2016-09-14T13:35:17.133Z"
  }
}
```

## GET #show
ユーザーの情報を取得.

### Example

#### Request
```
GET /users/1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 154
Content-Type: application/json; charset=utf-8
ETag: W/"84c1bb4b16f2341995e2ad35504d14c5"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 80807c10-b42f-410f-b166-e888eb22b7f8
X-Runtime: 0.002859
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 1,
    "name": "testuser",
    "token": null,
    "created_at": "2016-09-14T13:35:17.140Z",
    "updated_at": "2016-09-14T13:35:17.140Z"
  }
}
```
