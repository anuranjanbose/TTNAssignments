import UIKit

/*
 
 Task 3 : Difference between Frame and bound, Clip to bound and mask to bound, Strong and Weak Property.
 
 1. FRAME vs BOUNDS
 
 Bound is basically relative to a view's own coordinate system.
 
 e.g. bound of UIIView is the rectangle, relative to it's own coordinate system
 
 Frame of a view is relative to the superview it is contained within.
 
 e.g a View 'A' contains Sub-view 'B'. So frame of B is relative to A
 
 2. CLIP TO BOUND vs MASK TO BOUND
 
 *Clip to bound
 
 It is for sub-views which are partially outside it's main view
 
 e.g. there is a view(square), partially outside a circular view, then if we set clipsToBounds to yes, then only half the square will be shown. If set to No, whole square will be shown
 
 * Mask to Bound
 
 Any sublayers of the layer that extend outside its boundaries will be clipped to those boundaries. Think of the layer, in that case, as a window onto its sublayers; anything outside the edges of the window will not be visible. When masksToBounds is NO, no clipping occurs.
 
 
 3. STRONG vs WEAK PROPERTY
 
 Strong : It means we want to owe the object we are referencing with strong property. The object will not get destroyed as long as we are strongly referencing. We have to explicitly assign nil to object to destroy it.
 
 Weak : When we dont want control over an object's lifetime, we use weak property. It automatically sets the object to nil, when no strong reference is there on the object.
 
 
 */
