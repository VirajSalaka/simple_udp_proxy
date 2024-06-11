# Use the official Python base image from the Docker Hub
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY simple_udp_proxy/simple_udp_proxy/simple_udp_proxy.py /usr/src/app/simple-udp-proxy.py

# Make port 80 available to the world outside this container
EXPOSE 14520/udp

RUN chmod a+rwx /usr/src/app/simple-udp-proxy.py

# Run app.py when the container launches
CMD ["python3" ,"-u", "simple-udp-proxy.py", "--i", "14520", "--o", "53", "--log", "1", "--verbose", "1", "--destination", "8.8.8.8"]
# CMD ["tail", "-f", "/dev/null"]d