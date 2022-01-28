package task3;

public class Man {
    private String firstName;
    private String lastName;
    private int height;
    private Man father;

    public Man(String firstName, int height) {
        this.firstName = firstName;
        if (validHeight(height)) {
            this.height = height;
        }
    }

    public Man(String firstName, String lastName, int height) {
        this.firstName = firstName;
        this.lastName = lastName;
        if (validHeight(height)) {
            this.height = height;
        }
    }

    public Man(String firstName, int height, Man father) {
        this.firstName = firstName;
        this.height = height;
        this.father = father;
        this.lastName = father.lastName;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        if (validHeight(height)) {
            this.height = height;
        }
    }

    public Man getFather() {
        return father;
    }

    boolean validHeight(int height) {
        if (height < 0 || height > 500) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public String toString() {
        if (lastName != null) {
            if (height < 160) {
                return firstName + " " + lastName + " " + "маленький человек";
            } else if (height > 185) {
                return firstName + " " + lastName + " " + "большой человек";
            } else {
                return firstName + " " + lastName + " " + "обычный человек";
            }
        } else {
            if (height < 160) {
                return firstName + " " + "маленький человек";
            } else if (height > 185) {
                return firstName + " " + "большой человек";
            } else {
                return firstName + " " + "обычный человек";
            }
        }
    }
}


