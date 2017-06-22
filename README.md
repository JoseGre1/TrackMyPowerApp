# Track-MyPower

Modular web application written in Ruby on Rails for tracking variables related to power generation measured continuously in a hybrid renewable energy system (HRES). The system consists of a solar panel, a wind turbine and two acquisition systems (an Arduino MEGA and a Raspberry Pi that measure, process and report electrical and meteorological data in real-time, respectively). An API was developed for the reception of all the gathered data, which is stored in the application database after some validations. The application allows also the creation of users and assigns a customizable dashboard to each one. After user’s authentication information such as current, daily, weekly and monthly meteorological and electrical conditions are presented in different tables and charts. Furthermore, a notification system informs users about fails in the acquisition systems or values exceeding users customized thresholds for some variable via app and e-mail.

A video surveillance system involving a NC220 TP-Link Camera was also implemented. The video streaming can be accessed from the web application.

Main features:

* Users Management

* E-mail and App Notifications System

* Video Surveillance System

* Charts and Tables of Real-Time Data

* API

Live at: http://track-mypower.tk/

Sign up and try it. It's free!
