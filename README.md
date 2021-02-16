# Chowist

This repository includes a fork of the [the huangsam/chowist repository](https://github.com/huangsam/chowist). The original versions of the files are MIT licensed.

This fork shows how to run a Django + uWSGI application with [Amazon CodeGuru Profiler Python Agent](https://github.com/aws/amazon-codeguru-profiler-python-agent).

1. Make sure you have installed the latest version of [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html). Use an IAM entity for the AWS CLI that has permissions to access CodeGuru Profiler to create all the required components for the demo application to run.
    ```
    aws configure # Set up your AWS credentials and region as usual.
    ```

2. Create a profiling group in CodeGuru Profiler, named PythonDemoDjangoApplication.
    ```
    aws codeguruprofiler create-profiling-group --profiling-group-name PythonDemoDjangoApplication
    ```

3. Run the database migration:
    ```
    python manage.py migrate
    ```

4. Start the server with uswgi.
    ```
    uwsgi --http :8000 --chdir . --wsgi-file chowist/wsgi.py --enable-threads --lazy-apps
    ```

5. Generate some traffic.
    ```
    .demo/curl-requests.sh
    ```

6. Go to the [AWS CodeGuru Profiler console](https://console.aws.amazon.com/codeguru/profiler) to check the results. Choose the region you picked and your profiling group.
