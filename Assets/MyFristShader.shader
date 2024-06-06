Shader "Holistic/HelloShader" {
	Properties {
		_myColour ("Example Colour", Color) = (1,1,1,1)
		_myEmission ("Example Emission", Color) = (1,1,1,1)
		_myNormal ("Example Noraml", Color) = (1,1,1,1)
		
		}
	SubShader {

		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uvMainTex;
			};
			fixed4 _myColour;
			fixed4 _myEmission;
			fixed4 _myNormal;

			void surf (Input IN, inout SurfaceOutput o) {
				o.Emission = _myEmission.rgb * 0.1;
				o.Albedo = _myColour.rgb;
				o.Normal = _myNormal.rgb;
				}
		ENDCG
	}
	Fallback "Diffuse"
}
