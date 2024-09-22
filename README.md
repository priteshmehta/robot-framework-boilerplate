# robot-framework-boilerplate
Robot framework boilerplate for UI and API tests


##### Prerequisites

- Python 3.7.x (installed and configured)
```
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt 

```
- ChromeDriver is setup on and added to PATH variable on machine
    How to Setup ChromeDriver [Mac](https://medium.com/@tripleaceme/setting-up-chrome-driver-on-mac-0f32580912c3) & [Windows](https://medium.com/@patrick.yoho11/installing-selenium-and-chromedriver-on-windows-e02202ac2b08).


##### Run Browser tests
```
export USER_NAME=''
export USER_PASSWORD=''
robot -d report ui_tests/ 
```
##### Run API tests

```
export USER_AUTH_TOKEN=<AUTH_TOKEN>
robot -d report api_tests/ 
```

##### Resources
[How To Wirte Good Test](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)

[Robot Selenium keywords](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
