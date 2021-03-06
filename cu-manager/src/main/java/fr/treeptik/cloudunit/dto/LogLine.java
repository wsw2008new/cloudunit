package fr.treeptik.cloudunit.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by nicolas on 25/08/2014.
 */
final public class LogLine {

    private final String source;
    private final String message;

    public LogLine(String source, String message) {
        if (source == null) {
            throw new IllegalArgumentException("Source cannot be null");
        }
        if (message == null) {
            throw new IllegalArgumentException("Message cannot be null");
        }
        this.message = message;
        if (source != null && source.contains("/")) {
            this.source = source.substring(source.lastIndexOf("/") + 1);
        } else {
            this.source = source;
        }
    }

    public String getMessage() {
        return message;
    }

    public String getSource() {
        return source;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LogLine logLine = (LogLine) o;

        if (!source.equals(logLine.source)) return false;
        return message.equals(logLine.message);

    }

    @Override
    public int hashCode() {
        int result = source.hashCode();
        result = 31 * result + message.hashCode();
        return result;
    }
}
