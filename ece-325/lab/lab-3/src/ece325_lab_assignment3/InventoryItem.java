package ece325_lab_assignment3;

/**
 * InventoryItem encapsulates the behavior&information of one kind of equipment in the Inventory.
 * You can add items to the Inventory or bus, or wrap items inside this class.
 */
public class InventoryItem {
	private Equipment equipment; // Equipment object
	private int inInventory;     // How many of this type of equipment are in the Inventory
	private int inBus;           // How many of this type of equipment are in Bus
	private boolean isWrapped;   // Indicates whether we wrapped (all instances of) this type of equipment
	
	/**
	 * Constructor
	 * @param e equipment of this item
	 * @param need number of equipment that you own
	 */
	public InventoryItem(Equipment e, int need) {
		equipment = e;
		setInInventory(need);

		// If a given type of equipment does not need to wrap at all, then this
		// equivalent all equipments of this type in the inventory already
		// wrapped.
		if (!e.getNeedsWrapping())
			wrap();
	}
	
	public Equipment getEquipment() {
		return equipment;
	}
	
	public void setEquipment(Equipment e) {
		equipment = e;
	}
	
	public void setInInventory(int need) {
		inInventory = need;
	}
	
	public int getInInventory() {
		return inInventory;
	}
	
	public void setInBus(int have) {
		inBus = have;
	}
	
	public int getInBus() {
		return inBus;
	}
	
	/**
	 * Add equipment to the bus. For example, if this inventory item holds a chair, and you call addToBus(5), you will
	 * add 5 chairs to the bus. Make sure the number of each type in the bus does not exceed the number in the inventory.
	 * @param number of equipment that you want to add to bus
	 */
	public void addToBus(int number) {
	    if (number > getInInventory()) {
	    	number = getInInventory();
			System.out.println("The number of " + getEquipment() + "s you try to "
			+ "add into the bus exceed the number in the inventory.");
		}

	    setInBus(getInBus() + number);
	}
	
	/**
	 * Add equipment to Inventory. For example, if this inventory item holds a chair, and you call addToInventory(5), you will
	 * add 5 chairs to the inventory.
	 * @param number of equipment that you want to add to bus
	 */
	public void addToInventory(int number) {
		setInInventory(getInInventory() + number);
	}
	
	/**
	 * Check if this type of equipment needs wrapping or is already wrapped.
	 * @return isWrapped
	 */
	public boolean needsWrapping() {
	    return !isWrapped;
	}
	
	/**
	 * Wrap this type of equipment.
	 */
	public void wrap() {
		isWrapped = true;
	}
	
	public String toString() {
		StringBuffer str = new StringBuffer("[InventoryItem: " + equipment + ", in inventory: " + inInventory + ", in bus: " + inBus);
		if(equipment.getNeedsWrapping() && !isWrapped) {
			str.append(", STILL NEEDS WRAPPING!");
		}
		return str.append("]\n").toString();
		
	}
		
}
