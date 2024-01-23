FROM python:3.9-slim                     # Use an official Python runtime as the base image

WORKDIR /app                             # Set the working directory in the container

RUN apt-get update \                     # install required packages for system
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt .                   # Copy the requirements file into the container

RUN pip install mysqlclient               # Install app dependencies
RUN pip install -r requirements.txt 

COPY . .                                  # Copy the rest of the application code     

CMD ["python", "app.py"]

