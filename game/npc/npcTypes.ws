/*import class CVitalSpot
{
	import const var entitySlotName			: name;
	import const var focusPointsCost		: float;
	import const var visualEffect			: name;
	import const var gameplayEffects		: array< IGameplayEffectExecutor >;		//list of buffs applied when this spot is hit
	import const var normal					: Vector;
	import const var cutDirection			: Vector;
	import const var hitReactionAnimation	: name;
	import const var soundOnFocus			: string;
	import const var soundOffFocus			: string;
	import const var destroyAfterExecution	: bool;
	
	import function GetJournalEntry() : CJournalCreatureVitalSpotEntry;
}*/

/*enum EVitalSpotType // #B deprecated
{
	VST_Human_Bicep,
	VST_Human_Neck,
	VST_Human_Abdomen,
	VST_Human_KneeBack,
	VST_Human_Shield,
}*/

//npc death type
enum EDeathType
{
	EDT_Default,
	EDT_IgniDeath,
	EDT_AardDeath,
	EDT_Agony
}
/*
enum EDeathDirection
{
	EDD_Forward,
	EDD_Back,
	EDD_Left,
	EDD_Right,
}*/

enum EFinisherDeathType
{
	EFDT_None,
	EFDT_Head,
	EFDT_Torso,
	EFDT_ArmLeft,
	EFDT_ArmRight,	
	EFDT_LegLeft,
	EFDT_LegRight,		
}

//Fails on action attempts after disabling abilities by focus mode
enum EActionFail
{
	EAF_ActionFail1,
	EAF_ActionFail2,
	EAF_ActionFail3,
	EAF_ActionFail4,
	EAF_ActionFail5,
}

//Fails on action attempts after disabling abilities by focus mode
enum ETauntType
{
	TT_Taunt1,
	TT_Taunt2,
	TT_Taunt3,
	TT_Taunt4,
	TT_Taunt5,
	TT_Taunt6,
	TT_Taunt7,
	TT_Taunt8,
}

//behavior graphs
enum EBehaviorGraph
{
	EBG_None,
	EBG_Combat_Undefined,
	EBG_Combat_Shield,
	EBG_Combat_1Handed_Sword,
	EBG_Combat_1Handed_Axe,
	EBG_Combat_1Handed_Blunt,
	EBG_Combat_1Handed_Any,
	EBG_Combat_2Handed_Any,	
	EBG_Combat_2Handed_Sword,
	EBG_Combat_2Handed_Hammer,
	EBG_Combat_2Handed_Axe,
	EBG_Combat_2Handed_Halberd,
	EBG_Combat_2Handed_Spear,
	EBG_Combat_2Handed_Staff,
	EBG_Combat_Fists,
	EBG_Combat_Bow,
	EBG_Combat_Crossbow,
	EBG_Combat_Witcher,
	EBG_Combat_Sorceress,
	EBG_Combat_WildHunt_Imlerith,
	EBG_Combat_WildHunt_Imlerith_Second_Stage,
	EBG_Combat_WildHunt_Caranthir,
	EBG_Combat_WildHunt_Caranthir_Second_Stage,
	EBG_Combat_WildHunt_Eredin,
	EBG_Combat_Olgierd,
	EBG_Combat_Caretaker,
	EBG_Combat_Vampiress
}

//Spawn type
enum EExplorationMode
{
	EM_None,
	EM_Ground,
	EM_Air,
	EM_Water,
}


//Agony type
enum EAgonyType
{
	AT_ThroatCut,
	AT_Knockdown
}

enum ENPCFightStage
{
	NFS_Stage1,
	NFS_Stage2,
	NFS_Stage3,
	NFS_Stage4,
	NFS_Stage5
}

//Critical State
enum ECriticalStateType
{
	ECST_BurnCritical,
	ECST_HeavyKnockdown,
	ECST_Knockdown,
	ECST_LongStagger,
	ECST_Stagger,
	ECST_Hypnotized,
	ECST_Confusion,
	ECST_Blindness,
	ECST_Paralyzed,
	ECST_Immobilize,
	ECST_CounterStrikeHit,
	ECST_None,
	ECST_Swarm,
	ECST_Pull,
	ECST_Ragdoll,
	ECST_PoisonCritical,
	ECST_Snowstorm,
	ECST_Frozen,
	ECST_Tornado,
}

//higher priority overrides lower priority
function CalculateCriticalStateTypePriority(type : ECriticalStateType) : int
{
	//priority
	switch(type)
	{	
		case ECST_Frozen :				return 130;
		case ECST_Ragdoll :				return 120;
		case ECST_Tornado : 			return 115;
		case ECST_HeavyKnockdown :		return 110;
		case ECST_Knockdown :			return 100;
		case ECST_Paralyzed :			return 95;
		case ECST_Immobilize :			return 90;
		case ECST_Stagger :				return 80;
		case ECST_CounterStrikeHit :	return 75;
		case ECST_LongStagger :			return 70;
		case ECST_Pull :				return 60;
		case ECST_BurnCritical :		return 50;		
		case ECST_Swarm :				return 40;
		case ECST_Confusion :			return 30;
		case ECST_Hypnotized :			return 20;
		case ECST_Blindness :			return 15;
		case ECST_PoisonCritical :		return 10;
		case ECST_Snowstorm	: 			return 5;
		default :						return 0;
	}
}

enum EHitReactionDirection
{
	EHRD_Forward,
	EHRD_Back
}

enum EHitReactionSide
{
	EHRS_None,
	EHRS_Left,
	EHRS_Right,
}

enum EDetailedHitType
{
	EDHT_None,		//0
	EDHT_Straight,	//1
	EDHT_RightLeft,	//2
	EDHT_LeftRight	//3
	/*
	EDHT_None,
	EDHT_Jab,						//1
	EDHT_HorizontalRightLeft,		//2
	EDHT_HorizontalLeftRight,		//3
	EDHT_DiagonalUpRightDownLeft,	//4
	EDHT_DiagonalUpLeftDownRight,	//5
	EDHT_DiagonalDownRightUpLeft,	//6
	EDHT_DiagonalDownLeftUpRight,	//7
	EDHT_VerticalUpDown,			//8
	EDHT_VerticalDownUp				//9
	*/
}
enum EAttackType
{
	EAT_Attack1,
	EAT_Attack2,
	EAT_Attack3,
	EAT_Attack4,
	EAT_Attack5,
	EAT_Attack6,
	EAT_Attack7,
	EAT_Attack8,
	EAT_Attack9,
	EAT_Attack10,
	EAT_Attack11,
	EAT_Attack12,
	EAT_Attack13,
	EAT_Attack14,
	EAT_Attack15,
	EAT_Attack16,
	EAT_Attack17,
	EAT_Attack18,
	EAT_Attack19,
	EAT_Attack20,
	EAT_None
}
enum EChargeAttackType
{
	ECAT_Knockdown,
	ECAT_Stagger
}
// dodge type
enum EDodgeType
{
	EDT_Attack_Light,
	EDT_Attack_Heavy,
	EDT_Aard,
	EDT_Igni,
	EDT_Bomb,
	EDT_Projectile,
	EDT_Fear,
	EDT_Undefined
}

enum EDodgeDirection
{
	EDD_Back,
	EDD_Left,
	EDD_Right,
	EDD_Forward	
}

enum ETurnDirection
{
	ETD_Left,
	ETD_Right
}
// target direction
enum ETargetDirection
{
	ETD_Direction_0,
	ETD_Direction_45,
	ETD_Direction_90,
	ETD_Direction_135,
	ETD_Direction_180,
	ETD_Direction_m180,
	ETD_Direction_m135,
	ETD_Direction_m90,
	ETD_Direction_m45
}
enum ENpcPose
{
	ENP_LeftFootFront,
	ENP_RightFootFront
}

enum EFlightStance
{
	EFS_VerticalTurns,
	EFS_HorizontalTurns,
	EFS_Glide,
}

enum ENPCRightItemType
{
	RIT_None,
	RIT_Axe,
	RIT_Halberd,
	RIT_Sword,
	RIT_Torch,
	RIT_Crossbow
	
}

enum ENPCLeftItemType
{
	LIT_None,
	LIT_Torch,
	LIT_Shield,
	LIT_Bow,
}

enum EInventoryFundsType
{
	EInventoryFunds_Unlimited,
	EInventoryFunds_Rich,
	EInventoryFunds_Avg,
	EInventoryFunds_Poor
}

//-------------------------------------------------
//Weapon sub-types
//-------------------------------------------------

// -> 1handed weapons
enum EWeaponSubType1Handed
{
	EWST1H_Sword,
	EWST1H_Axe,
	EWST1H_Blunt,
}

// -> 2handed weapons
enum EWeaponSubType2Handed
{
	EWST2H_Hammer,
	EWST2H_Axe,
	EWST2H_Halberd,
	EWST2H_Spear,
	EWST2H_Staff,
}

// -> ranged weapons
enum EWeaponSubTypeRanged
{
	EWSTR_Bow,
	EWSTR_Crossbow,
}

//**************************************************
//Very important,
enum ENpcWeapons
{
	ENW_1h_Sword			= 0x0001,		// 0
	ENW_1h_Axe				= 0x0002,		// 1
	ENW_1h_Mace				= 0x0004,		// 2
	ENW_Shield				= 0x0008,		// 3
	ENW_2h_Sword			= 0x0010,		// 4
	ENW_2h_Axe				= 0x0020,		// 5
	ENW_2h_Mace				= 0x0040,		// 6
	ENW_2h_Bow				= 0x0080,		// 7
	ENW_2h_Crossbow			= 0x0100,		// 8
	ENW_2h_Halberd			= 0x0200,		// 9
	ENW_2h_Spear			= 0x0400,		// 10
}
enum ENpcFightingStyles
{
	ENFS_Sword 				= 0x0001,	// ENW_1h_Sword,
	ENFS_Mounted			= 0x0003,	// Horses and other mounts
	ENFS_SwordAndShield 	= 0x0009,	// ENW_1h_Sword | ENW_Shield,
	ENFS_Axe				= 0x0002,	// ,
	ENFS_AxeAndShield		= 0x000a,	// ,
	ENFS_Mace				= 0x0004,	// ,
	ENFS_MaceAndShield		= 0x000c,	// ,
	ENFS_2h_Sword			= 0x0010,	// ,
	ENFS_2h_Axe				= 0x0020,	// ,
	ENFS_2h_Mace			= 0x0040,	// ,
	ENFS_Bow				= 0x0080,	// ,
	ENFS_Crossbow			= 0x0100,	// ,
	ENFS_Halberd			= 0x0200,	// ,
	ENFS_Spear				= 0x0400,	// ,
	ENFS_Hjalmar			= 0x0800,	// GI Hjalmar
}
//***************************************************

function BehGraphIntToName( graphEnum : int ) : name
{
	switch( graphEnum )
	{
		case EBG_Combat_Shield 							: return 'Shield';
		
		case EBG_Combat_1Handed_Sword 					: return 'sword_1handed';
		case EBG_Combat_1Handed_Axe 					: return 'sword_1handed';
		case EBG_Combat_1Handed_Blunt 					: return 'sword_1handed';
		case EBG_Combat_1Handed_Any 					: return 'sword_1handed';
		
		case EBG_Combat_2Handed_Sword 					: return 'sword_2handed';
		
		case EBG_Combat_2Handed_Any 					: return 'TwoHanded';
		case EBG_Combat_2Handed_Hammer 					: return 'TwoHanded';
		case EBG_Combat_2Handed_Axe 					: return 'TwoHanded';
		case EBG_Combat_2Handed_Halberd 				: return 'TwoHanded';
		case EBG_Combat_2Handed_Spear 					: return 'TwoHanded';
		case EBG_Combat_2Handed_Staff 					: return 'TwoHanded';
		
		
		case EBG_Combat_Fists 							: return 'FistFight';
		
		case EBG_Combat_Bow 							: return 'Bow';
		case EBG_Combat_Crossbow						: return 'Bow';
		
		case EBG_Combat_Witcher							: return 'Witcher';
		
		case EBG_Combat_Sorceress						: return 'Sorceress';
		case EBG_Combat_Vampiress						: return 'Vampiress';
		
		case EBG_Combat_WildHunt_Imlerith				: return 'Imlerith';
		case EBG_Combat_WildHunt_Imlerith_Second_Stage	: return 'ImlerithSecondStage';
		case EBG_Combat_WildHunt_Caranthir				: return 'Caranthir';
		case EBG_Combat_WildHunt_Caranthir_Second_Stage : return 'CaranthirSecondStage';
		case EBG_Combat_WildHunt_Eredin					: return 'Eredin';
		
		case EBG_Combat_Olgierd							: return 'Olgierd';
		
		case EBG_Combat_Caretaker						: return 'Exploration';
		
		case EBG_None									: return 'None';

		default 										: return '';
	}
	
	return 'None';
}

function BehGraphEnumToName( graphEnum : EBehaviorGraph ) : name
{
	return BehGraphIntToName( (int)graphEnum );
}

import class CMonsterParam extends CGameplayEntityParam
{
	import var monsterCategory : int;
	import var soundMonsterName : name;
	import var isTeleporting : bool;
	import var canBeTargeted : bool;
	import var canBeHitByFists : bool;
	import var canBeStrafed : bool;
};

// imported
/*
enum ENpcStance
{
	NS_Normal,
	NS_Strafe,
	NS_Retreat,
	NS_Guarded,
	NS_Wounded,
	NS_Fly,
	NS_Swim,
}
*/