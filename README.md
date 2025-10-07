# The Goslip Project

Modern Rails 8 application inspired by the classic “Gossip Project” exercise. The UI shares a common layout with a light/dark toggle, neon-styled cards, and themed marketing pages.

- **Ruby**: `3.4.2`
- **Rails**: `8.0.3`
- **Database**: SQLite (development/test)
- **Primary gems**: Turbo + Stimulus, Propshaft, Faker, Solid queues/cable/cache.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Running Tests](#running-tests)
4. [Available Pages](#available-pages)
5. [Seeds & Demo Data](#seeds--demo-data)
6. [Contributing](#contributing)

## Getting Started
```bash
bundle install
bin/rails db:prepare
bin/rails db:seed   # optional but provides demo data
bin/rails server
```
Visit `http://localhost:3000` and use the navbar to explore the themed pages.

### Environment Variables
None required for local development.

### Linting / Formatting
Not enforced yet. Feel free to add Rubocop or StandardRB if needed.

## Project Structure
```
app/
  controllers/
    pages_controller.rb   # static sections + home feed
    gossips_controller.rb # gossip detail
  views/
    layouts/application.html.erb # global navbar + theme toggle
    pages/                 # home, team, contact
    gossips/show.html.erb  # gossip detail page
  assets/stylesheets/
    gossip-theme.css       # shared theme helpers (tiers, neon, halo…)
db/
  seeds.rb                 # Faker-based dataset for quick demos
```

## Running Tests
```bash
bin/rails test
```

## Available Pages
- `/` — Home with the latest gossips and quick links.
- `/pages/team` — Team presentation in the theme.
- `/contact` — Contact grid with halo/neon cards.
- `/gossips/:id` — Individual gossip detail view.

## Seeds & Demo Data
`db/seeds.rb` populates the following:
- Cities, Users (linked to cities), Tags
- Gossips (each tied to a user and tag)
- Comments, Private Messages, Likes
Run `bin/rails db:seed` whenever you need a fresh dataset.

## Contributing
1. Fork the repo.
2. Create a feature branch: `git checkout -b feat/name`.
3. Commit with clear messages.
4. Push and open a Pull Request.

Built as part of The Hacking Project training exercises.
