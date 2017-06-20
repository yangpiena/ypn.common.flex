package org.ypn.common.flatSpark.utils
{
	import org.ypn.common.flatSpark.enums.BrandColorEnum;
	import org.ypn.common.flatSpark.enums.ButtonColorEnum;
	
	import mx.states.State;

	/**
	 * 颜色工具类
	 * 
	 * @author YPN
	 * <br>Edit 2017-06-19
	 */
	public class ColorUtils
	{	
		/**
		 * 绿宝石
		 */
		public static const Turquoise:uint = 0x1ABC9C;
		/**
		 * 海洋绿
		 */
		public static const GreenSea:uint = 0x16A085;
		/**
		 * 翠绿色
		 */
		public static const Emerald:uint = 0x2ECC71;
		/**
		 * 春天的绿色
		 */
		public static const Nephritis:uint = 0x27AE60;
		/**
		 * 皇军蓝
		 */
		public static const PeterRiver:uint = 0x3498DB;
		/**
		 * 钢蓝
		 */
		public static const BelizeHole:uint = 0x2980B9;
		/**
		 * 紫色
		 */
		public static const Amethyst:uint = 0x9B59B6;
		/**
		 * 深紫罗兰色
		 */
		public static const Wisteria:uint = 0x8E44AD;
		/**
		 * 沥青色
		 */
		public static const WetAsphalt:uint = 0x34495E;
		/**
		 * 午夜的蓝色
		 */
		public static const MidnightBlue:uint = 0x2C3E50;
		/**
		 * 向日葵色
		 */
		public static const SunFlower:uint = 0xF1C40F;
		/**
		 * 橙色
		 */
		public static const Orange:uint = 0xF39C12;
		/**
		 * 胡萝卜色
		 */
		public static const Carrot:uint = 0xE67E22;
		/**
		 * 南瓜色
		 */
		public static const Pumpkin:uint = 0xD35400;
		/**
		 * 茜草色
		 */
		public static const Alizarin:uint = 0xE74C3C;
		/**
		 * 石榴色
		 */
		public static const Pomegranate:uint = 0xC0392B;
		/**
		 * 云彩色
		 */
		public static const Clouds:uint = 0xECF0F1;
		/**
		 * 银色
		 */
		public static const Silver:uint = 0xBDC3C7;
		/**
		 * 水泥色
		 */
		public static const Concrete:uint = 0x95A5A6;
		/**
		 * 石棉色
		 */
		public static const Asbestos:uint = 0x7F8C8D;
		/**
		 * 白色
		 */
		public static const White:uint = 0xFFFFFF;
		/**
		 * 浅蓝色
		 */
		public static const LightBLue:uint = 0xE0EFFE;
		/**
		 * 深蓝天空
		 */
		public static const DeepBLue:uint = 0x2179CB;
		
		
		public function ColorUtils()
		{
			
		}		
		
		public static function ButtonColor(brand:int, estado:State):uint
		{
			// Gera as cores possíveis
			var cores:Array = new Array(
				ButtonColorEnum.PrimaryUp, ButtonColorEnum.PrimaryHover, ButtonColorEnum.PrimaryDown, ButtonColorEnum.PrimaryDisabled,
				ButtonColorEnum.SuccessUp, ButtonColorEnum.SuccessHover, ButtonColorEnum.SuccessDown, ButtonColorEnum.SuccessDisabled,
				ButtonColorEnum.WarningUp, ButtonColorEnum.WarningHover, ButtonColorEnum.WarningDown, ButtonColorEnum.WarningDisabled,
				ButtonColorEnum.InverseUp, ButtonColorEnum.InverseHover, ButtonColorEnum.InverseDown, ButtonColorEnum.InverseDisabled,
				ButtonColorEnum.DefaultUp, ButtonColorEnum.DefaultHover, ButtonColorEnum.DefaultDown, ButtonColorEnum.DefaultDisabled,
				ButtonColorEnum.InfoUp, ButtonColorEnum.InfoHover, ButtonColorEnum.InfoDown, ButtonColorEnum.InfoDisabled,
				ButtonColorEnum.DangerUp, ButtonColorEnum.DangerHover, ButtonColorEnum.DangerDown, ButtonColorEnum.DangerDisabled
				);
			
			// Mapeia os estados permitidos para números
			var numeroEstado:int = 1;
			switch (estado.name)
			{
				case "up":
					numeroEstado = 1;
					break;
				case "over":
					numeroEstado = 2;
					break;
				case "down":
					numeroEstado = 3;
					break;
				case "disabled":
					numeroEstado = 3;
					break;
			}
			
			var posicao:int = 1;
			posicao = 4 * (brand - 1) + (numeroEstado - 1); 
			
			return cores[posicao];
		}
	}
}