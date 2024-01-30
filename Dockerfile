# Use the official Ubuntu image as the base image
FROM ubuntu:rolling

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install necessary dependencies for building and running Rust applications
RUN apt-get update && \
    apt-get install -y \
    curl \
    build-essential \
    openssh-server

# Install Rust using rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add Rust binaries to the PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Copy the pre-compiled Rust application binary into the container
COPY target/release/whaleshell .


RUN echo 'root:root' | chpasswd
RUN useradd -m test
RUN passwd -d test
RUN sed -i'' -e's/^#PermitRootLogin prohibit-password$/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PermitEmptyPasswords no$/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Configure SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Start SSH server and your Rust application
CMD ["/usr/sbin/sshd", "-D"]
