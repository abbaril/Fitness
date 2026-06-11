#include "textdisplay.h"

TextDisplay::TextDisplay(QObject *parent)
    : QObject(parent)
    , m_displaytime(QString())
    , m_seconds(0)
    , m_minutes(0)
    , m_distanceValue(0.0)
    , m_heartRateValue(60)
    , m_distance("0.00 ml")
    , m_pace("0:00")
    , m_heartRate("60 bpm")
    , m_displayText("00:00")

{
    m_timer = new QTimer( this );
    m_timer->setInterval(1000);

    connect(m_timer, QTimer::timeout, this , &TextDisplay::timeTicker);
    m_timer->start();
}


TextDisplay::~TextDisplay()
{
    m_timer->deleteLater();
}



//Setters
//Set the displaytext
void TextDisplay::setDisplayText(const QString& displayTime)
{
    if(m_displaytime != displayTime){
        m_displaytime = displayTime;
        emit displayTextChanged();
    }

}

//set the distance value
void TextDisplay::setDistance(const QString &distance)
{
    if (m_distance == distance) return;
    m_distance = distance;
    emit distanceChanged();
}

//set the pace value
void TextDisplay::setPace(const QString &pace)
{
    if (m_pace == pace) return;
    m_pace = pace;
    emit paceChanged();
}

//set the heartrate value
void TextDisplay::setHeartRate(const QString &heartRate)
{
    if (m_heartRate == heartRate) return;
    m_heartRate = heartRate;
    emit heartRateChanged();
}

//start the timer
void TextDisplay::startTimer()
{
    m_timer->start();
}

//pause the timer
void TextDisplay::pauseTimer()
{
    m_timer->stop();
}

//stop the timer
void TextDisplay::stopTimer() {
    m_timer->stop();
    m_seconds = 0;
    m_minutes = 0;
    m_distanceValue = 0.0;
    m_heartRateValue = 60;
    setDisplayText("00:00");
    m_distance = "0.00 ml";
    m_pace = "0:00";
    m_heartRate = "60 bpm";

}


//Getters
//return the timer
QString TextDisplay::displayText() const
{
    return m_displaytime;
}


//return the distance
QString TextDisplay::distance() const
{
    return m_distance;
}

//return the pace
QString TextDisplay::pace() const
{
    return m_pace;
}

//return the heartbeat
QString TextDisplay::heartRate() const
{
    return m_heartRate;
}






//the time ticker clock
void TextDisplay::timeTicker()
{
    m_seconds++;
    if(m_seconds >= 60) {

        m_seconds = 0;
        m_minutes++;
    }

    m_displayText = QString("%1:%2")
        .arg(m_minutes, 2, 10, QChar('0'))
        .arg(m_seconds, 2, 10, QChar('0'));
    emit displayTextChanged();

    // Update distance (increases every second)
    m_distanceValue += 0.01;
    m_distance = QString::number(m_distanceValue, 'f', 2) + " ml";
    emit distanceChanged();


    // Update pace based on time and distance
    if (m_distanceValue > 0) {
        int totalSeconds = m_minutes * 60 + m_seconds;
        int paceSeconds = static_cast<int>(totalSeconds / m_distanceValue);
        m_pace = QString("%1:%2")
            .arg(paceSeconds / 60)
            .arg(paceSeconds % 60, 2, 10, QChar('0'));
        emit paceChanged();
    }

    // Simulate heart rate (varies between 60-180)
    m_heartRateValue = 60 + (m_seconds % 120);
    m_heartRate = QString::number(m_heartRateValue) + " bpm";
    emit heartRateChanged();


    //mm:ss
    QString newDisplayText;
    if(m_minutes < 10)
        newDisplayText.append("0");

    newDisplayText.append(QString::number(m_minutes));

    newDisplayText.append(":");

    if(m_seconds < 10)
        newDisplayText.append("0");
    newDisplayText.append(QString::number(m_seconds));

    setDisplayText(newDisplayText);
}



