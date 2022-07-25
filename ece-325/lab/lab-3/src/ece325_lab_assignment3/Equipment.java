package ece325_lab_assignment3;

public abstract class Equipment {
	private boolean needsWrapping;   // A variable indicate whether this kind of equipment needs wrapping 
	
	/**
	 * Constructor
	 * @param needsWrapping boolean that indicates whether this type of equipment needs wrapping or not
	 */
	public Equipment(boolean needsWrapping) {
		setNeedsWrapping(needsWrapping);
	}
	
	public void setNeedsWrapping(boolean needsWrapping) {
		this.needsWrapping = needsWrapping;
	}
	
	public boolean getNeedsWrapping() {
		return needsWrapping;
	}
	
	/**
	 * Indicates whether some other equipment is the same type as this one.
	 * @param e equipment
	 */
	public boolean equals(Equipment e) {
		if (this == e) return true;

		return getClass() == e.getClass() &&
				getNeedsWrapping() == e.getNeedsWrapping();
	}
	
	public abstract String toString();
}


