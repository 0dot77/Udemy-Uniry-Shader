Shader "Holistic/BumpedEnvironment"
{
    Properties
    {
        _myTexture ("Texture", 2D) = "white" {}
        _myBump ("Bump", 2D) = "bump" {}
        _mySlider ("Normal Slider", Range(0,10)) = 0
        _myBright ("Brightness", Range(0,10)) = 1
        _myCube ("Cube Map", CUBE) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        sampler2D _myTexture;
        sampler2D _myBump;
        half _mySlider;
        half _myBright;
        samplerCUBE _myCube;

        struct Input
        {
            float2 uv_myTexture;
            float2 uv_myBump;
            float3 worldRefl; INTERNAL_DATA
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myTexture, IN.uv_myTexture).rgb;
            //o.Albedo = texCUBE(_myCube, IN.worldRefl).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)) * _myBright;
            o.Normal *= float3(_mySlider, _mySlider, 1);
            o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
