/**
 * @title:   java-like Map
 * @author:  lizhantao
 * @date:    2004-11-22
 * @email:   lazett@gmail.com
 * @warning: only support simple type key,String best!;
 */
function Map() {	
	this.pairs = new List();

	this.get = get;
	this.getA = getA;
	this.put = put;
	this.remove = remove;
	this.size = size;
	this.isEmpty = isEmpty;
	this.keySet = keySet;
	this.containsKey = containsKey;
	this.clearAllItems = clearAllItems;
  
	function Item(key, value){
	  this.key = key;
	  this.value = value;
	}
	
	function put(key, value){
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			if(item.key == key){
				item.value = value;
				return;
			}
		}
		this.pairs.add(new Item(key,value));
	}
	
	function getA(key)
	{
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			if(item.key === key){
				return item.value;
			}
		}
		return "";
	}
	function get(key)
	{
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			if(item.key === key){
				return item.value;
			}
		}
		return null;
	}
	function remove(key)
	{
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			if(item.key === key){
				iter.remove();
			}
		}
	}
	
	function clearAllItems()
	{
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			iter.remove();
		}
	}
	
	function size(){
		return this.pairs.size();
	}
	
	function isEmpty(){
		return this.pairs.size() <= 0;
	}
	function keySet(){
		var keys = new List();
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			keys.add(item.key);
		}
		return keys;
	}

	function valueSet(){
		var values = new List();
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			values.add(item.value);
		}
		return values;
	}

	function containsKey(key){
		for(var iter = this.pairs.iterator();iter.hasNext();){
			var item = iter.next();
			if(item.key === key){
				return true;
			}
		}
		return false;
	}
}
/**
 * @title:   java-like List
 * @author:  lizhantao
 * @date:    2004-11-22
 * @email:   lazett@gmail.com
 */
function List(){
	this.innerArray = new Array();
	this.add = add;
	this.get = get;
	this.remove = remove;
	this.size = size;
	this.isEmpty = isEmpty;
	this.iterator = iterator;
	this.contains = contains;

	function add(value){
		this.innerArray[this.innerArray.length] = value;
	}
	function get(i){
		if (i< 0 || i>= this.innerArray.length)
		{
			return;
		}
		return this.innerArray[i];
	}
	function remove(i){
		if (i< 0 || i>= this.innerArray.length)
		{
			return;
		}
		this.innerArray.splice(i,1);
	}
	function size(){
		return this.innerArray.length;
	}
	function isEmpty(){
		return this.innerArray.length <= 0;
	}
	function iterator(){
		return new Iterator(this);
	}
	function contains(object){
		for (var i = 0; i < this.pairs.length; i++)
		{
			if ( this.innerArray[i] === object )
			{
			  return true;
			}
		}
		return false;
	}
}
/**
 * @title:   java-like Set
 * @author:  lizhantao
 * @date:    2004-11-22
 * @email:   lazett@gmail.com
 * @warning: only support simple type value,String best!;
 */
function Set(){
	this.innerArray = new Array();
	this.add = add;
	this.get = get;
	this.remove = remove;
	this.size = size;
	this.isEmpty = isEmpty;
	this.iterator = iterator;
	this.contains = contains;
	
	function add(value){
		for (var i = 0; i < this.pairs.length; i++)
		{
			if ( this.innerArray[i] === value )
			{
			  return;
			}
		}
		this.innerArray[this.innerArray.length] = value;
	}
	function get(i){
		if (i< 0 || i>= this.innerArray.length)
		{
			return;
		}
		return this.innerArray[i];
	}
	function remove(i){
		if (i< 0 || i>= this.innerArray.length)
		{
			return;
		}
		this.innerArray.splice(i,1);
	}
	function size(){
		return this.innerArray.length;
	}
	function isEmpty(){
		return this.innerArray.length <= 0;
	}
	function iterator(){
		return new Iterator(this);
	}
	function contains(object){
		for (var i = 0; i < this.pairs.length; i++)
		{
			if ( this.innerArray[i] === object )
			{
			  return true;
			}
		}
		return false;
	}
}
/**
 * @title:   java-like Iterator
 * @author:  lizhantao
 * @date:    2004-11-22
 * @email:   lazett@gmail.com
 */
function Iterator(list){
	this.list = list;
	this.cursor = 0;
	this.hasNext = hasNext;
	this.next = next;
	this.remove = remove;

	function hasNext(){
		return this.cursor != this.list.size();
	}
	function next(){
		var result = this.list.get(this.cursor);
		this.cursor++;
		return result;
	}
	function remove(){
		this.cursor--;
		this.list.remove(this.cursor);
	}
}

