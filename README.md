# rlaalswhd199.github.io

[Quartz 5](https://quartz.jzhao.xyz) 로 만든 CV 한 쪽짜리 사이트입니다. → <https://rlaalswhd199.github.io/>

## CV를 고치는 법

1. Obsidian에서 `PARA/5_Personal/CV/index.md` 를 고친다.
2. 터미널에서 이 폴더로 와서 `./sync-cv.sh` 를 실행한다.
3. 1~2분 뒤 사이트에 반영된다.

`sync-cv.sh` 는 볼트의 `PARA/5_Personal/CV/` 폴더를 이 저장소의 `content/` 로 그대로 복사한 뒤 커밋·푸시한다.
**그 폴더에 넣은 파일은 전부 공개된다** — CV와 사진 말고 다른 노트를 넣지 말 것.

## 로컬에서 미리 보기

```
npm ci
npx quartz build --serve
```

## 구조

| 경로 | 하는 일 |
|---|---|
| `content/` | 사이트에 올라가는 글 (볼트에서 복사됨) |
| `quartz.config.yaml` | 제목·색·켜고 끈 기능 |
| `.github/workflows/deploy.yml` | `main` 에 푸시하면 GitHub Pages로 빌드·배포 |
| `sync-cv.sh` | 볼트 → `content/` 복사 + 푸시 |

## 알아 둘 것

- 이 맥의 `~/.npm` 캐시 폴더에 root 소유 파일이 섞여 있어서 `npm ci` 가 권한 오류로 멈춘다.
  한 번만 아래를 실행하면 풀린다(비밀번호 필요):

  ```
  sudo chown -R $(id -u):$(id -g) ~/.npm
  ```

  당장 고치기 싫으면 캐시 위치만 바꿔서 설치해도 된다:

  ```
  npm ci --cache /tmp/npm-cache
  ```
