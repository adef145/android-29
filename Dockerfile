FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ENV ANDROID_HOME      /opt/android-sdk
ENV ANDROID_SDK_HOME  ${ANDROID_HOME}
ENV ANDROID_SDK_ROOT  ${ANDROID_HOME}
ENV ANDROID_SDK       ${ANDROID_HOME}

ENV PATH "${PATH}:${ANDROID_HOME}/tools/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/tools"
ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools"

RUN dpkg --add-architecture i386 && \
	apt-get update -yqq && \
	apt-get install -y wget unzip openjdk-8-jdk
RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip -o -qq android-sdk.zip -d /opt/android-sdk

RUN yes | sdkmanager "platform-tools"
RUN yes | sdkmanager "platforms;android-29"
RUN yes | sdkmanager "build-tools;29.0.2"
RUN yes | sdkmanager --licenses
