# Setup to investigate an issue witk Kong using a Go plugin

* Build the Docker image containing Kong and a Go plugin
    ```sh
    make
    ```
* Go to the `test` folder and run the image:
    ```sh
    cd test
    docker-compose up
    ```
* Send a request through Kong
    ```sh
    curl -I http://localhost:8000
    ```

After starting the Docker container, we can see the following logs from Kong