#ifndef TEXTDISPLAY_H
#define TEXTDISPLAY_H

#include <QObject>
#include <QTimer>

class TextDisplay : public  QObject
{

    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText WRITE setDisplayText NOTIFY displayTextChanged FINAL)
    Q_PROPERTY(QString distance READ distance NOTIFY distanceChanged FINAL)
    Q_PROPERTY(QString pace READ pace NOTIFY paceChanged FINAL)
    Q_PROPERTY(QString heartRate READ heartRate NOTIFY heartRateChanged FINAL)

public:

    explicit TextDisplay(QObject *parent =  nullptr);
    ~TextDisplay();
    QString displayText() const;
    QString distance() const;
    QString pace() const;
    QString heartRate() const;

public slots:

    void setDisplayText(const QString &displayTime);
    void setDistance(const QString &distance);
    void setPace(const QString &pace);
    void setHeartRate(const QString &heartRate);
    void timeTicker();
    void startTimer();
    void pauseTimer();
    void stopTimer();


signals:

    void displayTextChanged();
    void distanceChanged();
    void paceChanged();
    void heartRateChanged();

private:

    QString m_displayText;
    QString m_distance;
    QString m_pace;
    QString m_heartRate;
    QString m_displaytime;
    QTimer *m_timer;

    int m_seconds;
    int m_minutes;
    double m_distanceValue;
    int m_heartRateValue;
};

#endif // TEXTDISPLAY_H
