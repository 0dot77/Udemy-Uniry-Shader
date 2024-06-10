Shader "Taeyang/BumpDiffuseChallenge"
{
    Properties
    {
        _myTexture ("Texture", 2D) = "white" {}
        _myBump ("Bump Texture", 2D) = "bump" {}
        _mySlider ("Slider Range", Range(0,10)) = 1
        _myBumpScale ("Texture Bump Scale", Range(0,2)) = 0
    }
    SubShader
    {

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        sampler2D _myTexture;
        sampler2D _myBump;
        half _mySlider;
        half _myBumpScale;

        struct Input
        {
            float2 uv_myTexture;
            float2 uv_myBump;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myTexture, IN.uv_myTexture).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _myBumpScale));
            o.Normal *= float3(_mySlider, _mySlider, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
