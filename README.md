# sinatra-hello-world

A simple Sinatra web application with Rake tasks and testing setup.

## Setup

1. Install Ruby 3.3.5 (check `.ruby-version` for the exact version)
2. Install dependencies:

    ```bash
    bundle install
    ```

## Running the App

### Development Server

```bash
bundle exec rackup config.ru
```

The app will be available at `http://localhost:9292`

### Production (Heroku)
The app is configured to run on Heroku using the Procfile. Heroku automatically runs:

```bash
bundle exec puma config.ru -p $PORT
```

## Testing

Run the full test suite:

```bash
bundle exec rspec
```

Run specific test files:

```bash
bundle exec rspec spec/app_spec.rb
bundle exec rspec spec/tasks/greeting_spec.rb
```

## Linting

This project uses Standard Ruby for code formatting and linting.

Check for style violations:

```bash
bundle exec standardrb
```

Auto-fix style violations:

```bash
bundle exec standardrb --fix
```

## Routes

- `GET /` - Returns "Hello, world!"
- `GET /h12` - Demonstrates Heroku H12 timeout (sleeps for 31 seconds)

## Rake Tasks

The application includes custom Rake tasks:

### Available Tasks

```bash
# List all available tasks
bundle exec rake -T
```

### Greeting Tasks

```bash
# English greeting
bundle exec rake greeting:english

# Japanese greeting  
bundle exec rake greeting:japanese
```

### Setting Up New Tasks

1. Create a new `.rake` file in `lib/tasks/`
2. Define your task using the standard Rake syntax:
   ```ruby
   namespace :your_namespace do
     task :your_task do
       # Task implementation
     end
   end
   ```
3. Tasks are automatically loaded via the `Rakefile`

## Project Structure

```
├── app/
│   ├── controllers/     # Application controllers
│   ├── views/          # View templates
│   └── public/         # Static assets
├── lib/
│   └── tasks/          # Custom Rake tasks
├── spec/               # Test files
├── app.rb              # Main application file
├── config.ru           # Rack configuration
└── Rakefile            # Rake configuration
```

