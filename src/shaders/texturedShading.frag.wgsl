@group(0) @binding(1) var mySampler: sampler;
@group(0) @binding(2) var myTexture: texture_2d<f32>;

const pi = 3.1415926535897932384626433832795;
const lightDirection = normalize(vec3<f32>(0.5, 0.7, 1.0));

@fragment
fn main(
  @location(0) normal: vec3f,
  @location(1) fragUV: vec2f,
) -> @location(0) vec4f {
  // Calculate the diffuse lighting based on the dot product of light direction and normal

  let diffuse = max(dot(normalize(normal), lightDirection), 0.1);

  return textureSample(myTexture, mySampler, fragUV) * diffuse;
}
