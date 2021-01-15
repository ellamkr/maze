class Stack<E>{
    private int t = -1;
    private E[] data;
    private int capacity = 10000;
    public Stack(){
        this.data= (E[ ]) new Object[this.capacity];
    }
    public int size(){
        return this.t+1;
    }
    public boolean isEmpty(){
        return this.t == -1;
    }
    public void push(E element){
        if(size() < this.data.length){
            this.data[this.t+1] = element;
            this.t++;
        }
        else{
        System.out.println("Stack is full");
        }
    }
    public E pop(){
        if(isEmpty()){
        return null;
        }
        else{
            E el = this.data[this.t];
            this.data[this.t] = null;
            t--;
            return el;
        }
    }
    public E top(){
        if(isEmpty()){
        return null;
        }
        else {
            return(this.data[this.t]);
        }
    }
}
