
import java.util.*;
import java.io.*;

public class MyList {

    Node head;

    MyList() {
        this.head = null;
    }

    public boolean isEmpty() {
        return this.head == null;
    }

    public void clear() {
        this.head = null;
    }

    void traverse() {
        Node p = head;
        while (p != null) {
            System.out.print(p.info);
            System.out.print("   ");
            p = p.next;
        }
    }

    void loadData(int k) {
        for (int i = 0; i < k; i++) {
            Random generator = new Random();
            int number = generator.nextInt(1000) + 1;
            addFirst(number);
        }
    }

    void addFirst(int n) {
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        Node newNode = new Node(n);
        newNode.next = head;
        head = newNode;

        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
    }

    void addLast(int n) {
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        Node newNode = new Node(n);
        if (head == null) {
            head = newNode;
            return;
        }
        Node temp = head;
        while (temp.next != null) {
            temp = temp.next;

        }
        temp.next = newNode;

        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
    }

    void f1() {
        System.out.print("Linked list:   ");
        this.traverse();
    }

    // f2: ham addLast ==> du lieu nhap tu ban phim
    void f2() {
        System.out.print("Before:   ");
        this.traverse();
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        Scanner sc = new Scanner(System.in);
        System.out.println("\nEnter the number to add last:\n");
        int n = sc.nextInt();
        addLast(n);

        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
        System.out.print("After:    ");
        this.traverse();
    }

    // f3: ham addPos ==> them node vao vi tri thu k, trong do node moi va chi so k duoc nhap tu ban phim
    void f3() {
        System.out.print("Before:   ");
        this.traverse();
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        Scanner sc = new Scanner(System.in);
        System.out.println("\nEnter the index to add\n");
        int k = sc.nextInt();
        sc.nextLine();
        System.out.println("\nEnter the number to add\n");
        int n = sc.nextInt();
        if (k <= 0) {
            addFirst(n);
        } else {
            Node newNode = new Node(n);
            Node temp = head;
            for (int i = 0; temp != null && i < k - 1; i++) {
                temp = temp.next;
            }
            if (temp == null || temp.next == null) {
                addLast(n);
            } else {
                newNode.next = temp.next;
                temp.next = newNode;
            }
        }

        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
        System.out.print("After:    ");
        this.traverse();
    }

    // f4: removeFirst
    void f4() {
        System.out.print("Before:   ");
        this.traverse();
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        if (head != null) {
            head = head.next;
        }

        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
        System.out.print("After:    ");
        this.traverse();
    }

    // f5: removeLast
    void f5() throws Exception {
        System.out.print("Before:   ");
        this.traverse();
        //------------------------------------------------------------------------------------
        //------ Start your code here---------------------------------------------------------
        if (head == null) {
            throw new Exception("List is empty, cannot remove last element.");
        }
        if (head.next == null) {
            head = null;
        } else {
            Node temp = head;
            while (temp.next.next != null) {
                temp = temp.next;
            }
            temp.next = null;

        }
        //------ End your code here-----------------------------------------------------------
        //------------------------------------------------------------------------------------
        System.out.print("After:    ");
        this.traverse();
    }
}
