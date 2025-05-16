# Use the official Ruby base image
FROM ruby:3.1

# Set environment variables with defaults
ENV RACK_ENV=production \
    PORT=8000 \
    WEB_CONCURRENCY=1 \
    MAX_THREADS=1

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Install bundler and application dependencies
RUN gem install bundler && \
    bundle install --without development test

# Expose the application's port
EXPOSE ${PORT}

# Define the default command to run the application with Puma
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
