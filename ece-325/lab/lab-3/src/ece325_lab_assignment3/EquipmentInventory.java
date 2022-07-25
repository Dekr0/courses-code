package ece325_lab_assignment3;

import java.util.ArrayList;

public class EquipmentInventory {
	// your inventory of items
	ArrayList<InventoryItem> inventory;

	public EquipmentInventory() {
		inventory = new ArrayList<InventoryItem>();
	}

	/**
	 * Stow equipment into the trunk of the bus. Note: every type of equipment
	 * should only occur once in the inventory. Make sure to check if you are not
	 * accidentally taking someone else's equipment.
	 * 
	 * @param equip  The type of equipment to stow
	 * @param number The number of items to stow
	 */
	public void addEquipmentToBus(Equipment equip, int number) {
		for (InventoryItem inventoryItem: inventory) {
			if (inventoryItem.getEquipment().equals(equip)) {
				inventoryItem.addToBus(number);
				return;
			}
		}

		System.err.printf("%s is not in the inventory", equip);
	}

	/**
	 * Add equipment to your inventory. Note: every type of equipment
	 * should only occur once in the inventory. Whenever you acquire new
	 * equipment, it is always outside the bus. 
	 * 
	 * @param equip  The type of equipment to add to your inventory
	 * @param number The number of items to add
	 */
	public void addEquipmentToInventory(Equipment equip, int number) {
		for (InventoryItem inventoryItem : inventory) {
			if (inventoryItem.getEquipment().equals(equip)) {
				inventoryItem.addToInventory(number);
				return;
			}
		}

		InventoryItem newInventoryItem = new InventoryItem(equip, number);
		inventory.add(newInventoryItem);
	}

	
	/**
	 * Returns a list of items that are still missing from the bus. 
	 * @return List of missing items.
	 */
	public ArrayList<InventoryItem> getMissingItems() {
		ArrayList<InventoryItem> missItems = new ArrayList<InventoryItem>();
		for (InventoryItem inventoryItem: inventory) {
			if (inventoryItem.getInInventory() != inventoryItem.getInBus())
				missItems.add(inventoryItem);
		}

		return missItems;
	}

	/**
	 * Returns a list of items that still need wrapping. Note that these items might still 
	 * be (partially) missing from the bus too. 
	 * @return List of items that still need to be wrapped.
	 */
	public ArrayList<InventoryItem> getNeedsWrappingItems() {
		ArrayList<InventoryItem> needsWrappingItems = new ArrayList<InventoryItem>();
		for (InventoryItem inventoryItem : inventory) {
			if (inventoryItem.needsWrapping())
				needsWrappingItems.add(inventoryItem);
		}

		return needsWrappingItems;
	}

	/**
	 * Wrap items of the same type as e.
	 * @param e type of equipment you want to wrap.
	 */
	public void wrapItems(Equipment e) {
		for (InventoryItem inventoryItem : inventory) {
			if (inventoryItem.getEquipment().equals(e)){
				inventoryItem.wrap();
				break;
			}
		}
	}

	/** 
	 * Returns a string representation of the inventory.
	 */
	public String toString() {
		if (inventory.size() == 0) return "Empty Inventory";

		StringBuilder list = new StringBuilder();
		for (InventoryItem inventoryItem: inventory) {
			list.append(inventoryItem.toString());
		}

		return list.toString();
	}

	/** 
	 * Returns true iff the inventory is complete, wrapped and you are ready to go.
	 * @return true iff inventory is complete and wrapped
	 */
	public boolean getReadyToGo() {
		for (InventoryItem inventoryItem : inventory)
			if (inventoryItem.needsWrapping() || inventoryItem.getInInventory() != inventoryItem.getInBus())
				return false;

		return true;
	}

	public static void main(String[] args) {
		
		EquipmentInventory myInv = new EquipmentInventory();

		//Add 2 microphones, 4 guitars and 12 chairs to Equipment Inventory
		myInv.addEquipmentToInventory(new Microphone(true), 2);
		myInv.addEquipmentToInventory(new Guitar(true), 4);
		myInv.addEquipmentToInventory(new Chair(false), 12);

		System.out.println(myInv);

		System.out.println("Printing missing items: ");
		ArrayList<InventoryItem> missing = myInv.getMissingItems();
		System.out.println(missing);

		System.out.println("Printing items that need wrapping: ");
		ArrayList<InventoryItem> needsWrapping = myInv.getNeedsWrappingItems();
		System.out.println(needsWrapping);
		
		//Try to add 15 chairs to bus

        myInv.addEquipmentToBus(new Chair(false), 15);

		System.out.println(myInv);

		System.out.println(myInv.getReadyToGo());
		
		//Try to add 4 guitars and 2 microphones to bus

		myInv.addEquipmentToBus(new Guitar(true), 4);
		myInv.addEquipmentToBus(new Microphone(true), 2);

		System.out.println(myInv.getReadyToGo());

		//Wrap items that need wrapping but have not been wrapped yet

		myInv.wrapItems(new Guitar(true));
		myInv.wrapItems(new Microphone(true));

		System.out.println(myInv.getReadyToGo());
	}
}
