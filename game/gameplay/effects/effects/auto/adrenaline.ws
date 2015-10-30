/***********************************************************************/
/** Witcher Script file
/***********************************************************************/
/** Copyright © 2014
/** Author : Tomek Kozera
/***********************************************************************/

class W3Effect_AdrenalineDrain extends CBaseGameplayEffect
{
	default effectType = EET_AdrenalineDrain;
	default attributeName = 'focus_drain';
	default isPositive = false;
	default isNeutral = true;
	default isNegative = false;
	
	event OnEffectAdded(optional customParams : W3BuffCustomParams)
	{
		var witcher : W3PlayerWitcher;
	
		witcher = (W3PlayerWitcher)target;
	
		if(!witcher)
		{
			LogEffects("W3Effect_AdrenalineDrain.OnEffectAdded: trying to add on non-witcher, aborting!");
			isActive = false;
			return false;
		}
	
		super.OnEffectAdded(customParams);
	}
		
	event OnUpdate(dt : float)
	{
		var drainVal : float;
		var buff : W3Effect_Toxicity;
		
		//if entered combat again - remove effect
		if(target.IsInCombat() && !target.HasBuff(EET_Runeword8))
			isActive = false;
			
		drainVal = dt * (effectValue.valueAdditive + (target.GetStatMax(BCS_Focus) + effectValue.valueBase) * effectValue.valueMultiplicative);
		((CR4Player)target).DrainFocus(drainVal);
		
		//if all focus drained
		if(target.GetStat(BCS_Focus) <= 0)
		{
			isActive = false;			
		}
	}
}