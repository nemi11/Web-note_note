```markdown
#Web Note for English Learners

英語学習者のための、完全カスタマイズ可能な英語のメモ。  
シチュエーション別にフレーズを検索・保存でき、単語帳やタグ管理も可能。  
学習スタイルに合わせて自由にノートを構築できます。

---

## Motivation

「自分が使いたい場面での表現を集めたい」  
そんな思いと、自分自身の学習体験から実用性と柔軟性がある、
自由度の高いノートツールを作りたいと思いました  。


---

## Target Users

- 中高生・大学生：学習や興味に沿った表現を集めたい
- 社会人：目的別に効率よく英語を管理したい
- 旅行者など：場面で使える例文や単語帳を作成・共有したい
- 英語学習者：イディオム、専門用語など使い方を共有し理解を高めたい

---

## Usage Example

- 「空港で使える英語」などのシチュエーションで検索
- 関連フレーズをノートに追加し、タグや色分けで整理
- 単語帳を作成し、スペースドリピティションで復習
- AIによる表現提案やフィードバック（今後できたら実装予定）

---

## User Acquisition Strategy

- 英語学習系SNSで発信（X, Instagram, Reddit）

---

## Differentiation

- シチュエーション検索 × ノート機能の融合
- 英語学習者の「使える表現をノート化」
- カスタマイズ可能なUI（色、レイアウト、タグ）
- AIによる表現提案・フィードバック（未定）

---

## Planned Features

| リリース段階  | 機能 |
|--------------|-----|
| MVP          | ノート作成・編集、タグ管理、シチュエーション検索、単語帳作成 |
| 本リリース    | スペースドリピティション、ノート共有、音声読み上げ、|

---

## Tech Stack

- **Framework**：Ruby on Rails 7 + Hotwire (Turbo + Stimulus)
- **CSS**：Tailwind CSS
- **Database**：PostgreSQL
- **Deployment**：Render（またはHeroku）
- **Main Gems**：
  - Devise（ユーザー認証）
  - Acts-as-taggable-on（タグ機能）
  - Ransack（検索機能）
  - Sidekiq（非同期ジョブ）
  - Stimulus-use（UIインタラクション強化）

---

## Setup Instructions

### Requirements

- Ruby 3.2.x  
- Node.js & Yarn  
- PostgreSQL  

### Installation

```bash
bundle install
yarn install
rails db:create db:migrate db:seed
```

### Running the App

```bash
bin/dev
```

### Running Tests

```bash
bundle exec rspec
```

---

## Services

- **Job Queue**：Sidekiq  
- **Search Engine**：Ransack  
- **Cache Server**：Redis（予定）

---

## Deployment

Renderを使用してデプロイ予定。  
環境変数は `.env` ファイルで管理。

---

## Contact

開発者: ねね
Twitter: [@nene_RUNTEQ]  
Email: ne081310751569@gmail.com
