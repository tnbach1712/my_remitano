# Use the official Ruby image as the base image
FROM ruby:3.1.4

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Install dependencies required for installing NVM and Node.js
RUN apt-get update -qq && apt-get install -y curl gnupg build-essential libssl-dev
# Install NVM
ENV NVM_DIR /usr/local/.nvm
ENV NODE_VERSION 18.0.0

RUN mkdir -p $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
  && . "$NVM_DIR/nvm.sh" \
  && nvm install $NODE_VERSION \
  && nvm use $NODE_VERSION \
  && nvm alias default $NODE_VERSION

# Add Node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install Yarn
RUN npm install --global yarn

# Copy the rest of your application code
COPY . .

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Expose the port the app runs on
EXPOSE 3000
# Start the main process (puma server, for example)
# CMD ["rails", "server", "-b", "0.0.0.0"]
CMD ["./bin/dev"]
