package semester.project.util;

import java.util.Date;
import java.util.Random;
import java.util.stream.Collectors;

public class Session {
    public static final long ACTIVE_TIME_LIMIT = 15000;
    public static final long CREATION_TIME_LIMIT = 30000;
    public static final int SESSION_IDENTIFIER_LENGTH = 32;

    private final String identifier;
    private final Date creationDate;
    private Date lastActiveDate;

    public Session() {
        this.identifier = generateRandomIdentifier();
        this.creationDate = new Date();
        this.lastActiveDate = new Date();
    }

    public String getIdentifier() {
        return this.identifier;
    }

    public Date getCreationDate() {
        return this.creationDate;
    }

    public Date getLastActiveDate() {
        return this.lastActiveDate;
    }

    private static String generateRandomIdentifier() {
        return new Random()
                .ints(0, 52)
                .limit(SESSION_IDENTIFIER_LENGTH)
                .mapToObj((character) -> Character.toString((char) (character < 26 ? character + 'A' : character + 'a' - 26)))
                .collect(Collectors.joining());
    }
}
