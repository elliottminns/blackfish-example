FROM ubuntu:15.10

# Latest Swift Development Snapshot
ENV SWIFT_BRANCH development
ENV SWIFT_VERSION DEVELOPMENT-SNAPSHOT-2016-02-08-a
ENV SWIFT_PLATFORM ubuntu15.10

# Install Dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        wget \
        clang \
        libedit-dev \
        python2.7 \
        python2.7-dev \
        libicu55 \
        libxml2 \
        rsync \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Download and install Swift
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Update paths
ENV PATH /usr/bin:$PATH

# Expose port 4000 to allow webserver interaction
EXPOSE 4000

# Copy and build the example app
RUN mkdir -p /blackfish
WORKDIR /blackfish
ADD . /blackfish
RUN swift build

# Start the webserver
CMD .build/debug/BlackfishApp
