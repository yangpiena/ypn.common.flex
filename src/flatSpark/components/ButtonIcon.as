package flatSpark.components
{

	import flatSpark.enums.BrandColorEnum;
	
	import spark.components.Button;

	public class ButtonIcon extends spark.components.Button
	{

		/**
		 * 图像字
		 * 
		 * <br>参考值：AwesomeUtils.fa_glass
		 */
		[Bindable]
		public var iconFont:String;
		
		/**
		 * 品牌
		 * 
		 * <br>默认值：BrandColorEnum.Default
		 */
		[Bindable]
		public var brand:int = BrandColorEnum.Default;


		public function ButtonIcon()
		{
			super();
		}

	}
}
