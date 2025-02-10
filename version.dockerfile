# Use an official Ruby Alpine image
FROM ruby:3.0-alpine

# Install necessary dependencies
RUN apk add --update --no-cache \
    build-base \
    git

# Set the working directory
WORKDIR /app

# Clone the Asciidoctor repository from GitHub
RUN git clone https://github.com/asciidoctor/asciidoctor.git

# Move into the cloned repository
WORKDIR /app/asciidoctor

# Build and install Asciidoctor from the gemspec
RUN gem build asciidoctor.gemspec
RUN gem install asciidoctor-*.gem

# Provide a default command that prints the version
CMD ["asciidoctor", "-v"]
